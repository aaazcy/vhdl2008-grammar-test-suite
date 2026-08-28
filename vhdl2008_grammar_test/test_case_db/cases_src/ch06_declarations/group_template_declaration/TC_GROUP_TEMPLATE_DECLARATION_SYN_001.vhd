-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Positive
-- Test Focus: group_template_declaration: template with signal <> and constant <> entity class entries
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gtd_signal_constant_tmpl_syn is
  port (
    dout : out bit_vector(3 downto 0)
  );
end entity gtd_signal_constant_tmpl_syn;

architecture focused of gtd_signal_constant_tmpl_syn is
  group reg_file is (signal, constant <>);
  signal s_reg : bit_vector(3 downto 0) := "0001";
  constant C_MASK : bit_vector(3 downto 0) := "1111";
  group my_regs : reg_file (s_reg, C_MASK);
begin
  s_reg <= s_reg(2 downto 0) & s_reg(3) after 8 ns;
  dout <= s_reg and C_MASK;
end architecture focused;
