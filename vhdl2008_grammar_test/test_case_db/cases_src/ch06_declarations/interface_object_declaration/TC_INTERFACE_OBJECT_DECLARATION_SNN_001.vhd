-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::=
--   interface_constant_declaration
--   | interface_signal_declaration
--   | interface_variable_declaration
--   | interface_file_declaration
-- Case Type: Negative
-- Test Focus: SNN — missing colon token between identifier_list
--   and subtype_indication in an interface_signal_declaration
--   within an entity port clause. The colon is a mandatory BNF
--   token that separates the identifier_list from the mode/type.
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity iface_obj_missing_colon_e is
  port (
    signal clk : in bit;
    -- ERROR: missing colon between identifier_list "data_out" and mode "out"
    signal data_out out bit_vector(7 downto 0)
  );
end entity iface_obj_missing_colon_e;

architecture err of iface_obj_missing_colon_e is
begin
end architecture err;
