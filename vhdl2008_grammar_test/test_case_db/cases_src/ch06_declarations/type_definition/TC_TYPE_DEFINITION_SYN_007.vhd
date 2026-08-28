-- =============================================================
-- Case ID: TC_TYPE_DEFINITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_definition ::= scalar_type_definition composite_type_definition | access_type_definition | file_type_definition | protected_type_definition
-- Case Type: Positive
-- Test Focus: Exercises type_definition syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_definition_syn7 is
  port (
    clk   : in  bit;
    addr  : in  integer range 0 to 1023;
    data  : out bit_vector(9 downto 0)
  );
end entity type_definition_syn7;

architecture rtl of type_definition_syn7 is
  type t_lut is array(0 to 1023) of bit_vector(9 downto 0);
  signal s_table : t_lut := (others => (others => '0'));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      for i in 0 to 1023 loop
        s_table(i) <= (others => '1');
      end loop;
      data <= s_table(addr);
    end if;
  end process;
end architecture rtl;
