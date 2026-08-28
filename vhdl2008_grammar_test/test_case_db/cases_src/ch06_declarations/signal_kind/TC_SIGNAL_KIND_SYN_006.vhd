-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Positive
-- Test Focus: Exercises signal_kind syntax variant 6 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_kind_syn6 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(9 downto 0);
    accum : out integer range 0 to 32
  );
end entity signal_kind_syn6;

architecture rtl of signal_kind_syn6 is
  signal s_accum : integer range 0 to 32 := 0;
  signal s_data  : bit_vector(9 downto 0) := (others => '0');
begin
  process(clk)
    variable v_temp : integer range 0 to 32 := 0;
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      v_temp := 0;
      for i in 0 to 9 loop
        if s_data(i) = '1' then
          v_temp := v_temp + 1;
        end if;
      end loop;
      s_accum <= (s_accum + v_temp) mod 33;
    end if;
  end process;
  accum <= s_accum;
end architecture rtl;
