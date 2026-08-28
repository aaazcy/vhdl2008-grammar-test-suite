-- =============================================================
-- Case ID: TC_SUBTYPE_INDICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_indication ::= [ resolution_indication ] type_mark [ constraint ]
-- Case Type: Positive
-- Test Focus: Exercises subtype_indication with constraint as range in signal declarations for a PWM generator.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subtype_ind_syn3 is
  port (
    clk       : in  bit;
    duty_byte : in  bit_vector(7 downto 0);
    pwm_out   : out bit
  );
end entity subtype_ind_syn3;

architecture rtl of subtype_ind_syn3 is
  signal s_counter : integer range 0 to 255 := 0;
  signal s_duty    : integer range 0 to 255 := 0;
  signal s_thresh  : integer range 0 to 255 := 128;
begin
  process(clk)
    variable v_val : integer range 0 to 255 := 0;
  begin
    if clk'event and clk = '1' then
      if s_counter = 255 then
        s_counter <= 0;
      else
        s_counter <= s_counter + 1;
      end if;
      v_val := 0;
      for i in 0 to 7 loop
        if duty_byte(i) = '1' then
          v_val := v_val + 2**i;
        end if;
      end loop;
      s_duty <= v_val;
    end if;
  end process;
  pwm_out <= '1' when s_counter < s_duty else '0';
end architecture rtl;
