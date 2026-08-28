-- =============================================================
-- Case ID: TC_SEM_INTERFACE_OBJECT_DECLARATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::=
--   interface_constant_declaration
--   | interface_signal_declaration
--   | interface_variable_declaration
--   | interface_file_declaration
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — an interface_variable_declaration
--   appears in an entity port clause. The syntax is individually
--   valid for each keyword, but semantically, variable-class
--   interface objects are only permitted in subprogram parameter
--   lists, not in entity port clauses (ports must be signals).
-- Expected Result: Triggers semantic error (variable in port clause)
-- Dependencies: None
-- =============================================================
entity iface_obj_var_in_port_e is
  port (
    signal clk      : in  bit;
    -- ERROR: variable class not allowed in entity port clause
    variable state   : inout integer
  );
end entity iface_obj_var_in_port_e;

architecture rtl of iface_obj_var_in_port_e is
begin
end architecture rtl;
