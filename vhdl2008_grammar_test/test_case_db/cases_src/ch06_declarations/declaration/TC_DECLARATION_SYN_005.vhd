-- =============================================================
-- Case ID: TC_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Positive
-- Test Focus: Exercises declaration via object_declaration path combining constant, signal, and variable declarations.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity declaration_syn5 is
  port (
    clk    : in  bit;
    data   : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity declaration_syn5;

architecture rtl of declaration_syn5 is
  constant C_XOR_MASK : bit_vector(7 downto 0) := "01010101";
  signal s_reg1 : bit_vector(7 downto 0) := (others => '0');
  signal s_reg2 : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk)
    variable v_temp : bit_vector(7 downto 0) := (others => '0');
  begin
    if clk'event and clk = '1' then
      v_temp := data xor C_XOR_MASK;
      s_reg1 <= v_temp;
      s_reg2 <= s_reg1;
      result <= s_reg2;
    end if;
  end process;
end architecture rtl;
