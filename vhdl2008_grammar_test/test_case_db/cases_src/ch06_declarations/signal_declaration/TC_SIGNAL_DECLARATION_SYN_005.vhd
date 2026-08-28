-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises signal_declaration syntax variant 5 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_declaration_syn5 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(8 downto 0);
    accum : out integer range 0 to 16
  );
end entity signal_declaration_syn5;

architecture rtl of signal_declaration_syn5 is
  signal s_accum : integer range 0 to 16 := 0;
  signal s_data  : bit_vector(8 downto 0) := (others => '0');
begin
  process(clk)
    variable v_temp : integer range 0 to 16 := 0;
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      v_temp := 0;
      for i in 0 to 8 loop
        if s_data(i) = '1' then
          v_temp := v_temp + 1;
        end if;
      end loop;
      s_accum <= (s_accum + v_temp) mod 17;
    end if;
  end process;
  accum <= s_accum;
end architecture rtl;
