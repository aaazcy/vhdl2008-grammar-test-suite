-- =============================================================
-- Case ID: TC_OBJECT_DECLARATION_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2
-- Production: object_declaration ::= constant_declaration signal_declaration | variable_declaration | file_declaration
-- Case Type: Positive
-- Test Focus: Exercises object_declaration syntax variant 11 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity object_declaration_syn11 is
  port (
    clk   : in  bit;
    data  : in  bit_vector(10 downto 0);
    accum : out integer range 0 to 32
  );
end entity object_declaration_syn11;

architecture rtl of object_declaration_syn11 is
  signal s_accum : integer range 0 to 32 := 0;
  signal s_data  : bit_vector(10 downto 0) := (others => '0');
begin
  process(clk)
    variable v_temp : integer range 0 to 32 := 0;
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      v_temp := 0;
      for i in 0 to 10 loop
        if s_data(i) = '1' then
          v_temp := v_temp + 1;
        end if;
      end loop;
      s_accum <= (s_accum + v_temp) mod 33;
    end if;
  end process;
  accum <= s_accum;
end architecture rtl;
