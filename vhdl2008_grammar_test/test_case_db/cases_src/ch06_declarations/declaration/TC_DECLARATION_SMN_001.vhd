-- =============================================================
-- Case ID: TC_DECLARATION_SMN_001
-- Related Rule ID: SMN_DECLARAT_001
-- Rule Type: Semantic
-- BNF Production: DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1, Section 12.3
-- Production: declaration ::= type_declaration | subtype_declaration
--   | object_declaration | interface_declaration
--   | alias_declaration | attribute_declaration
--   | component_declaration | group_template_declaration
--   | group_declaration | entity_declaration
--   | configuration_declaration | subprogram_declaration
--   | package_declaration
-- Test Focus: Duplicate identifier across declaration kinds —
--   a type and a constant share the same name in the same
--   declarative region (architecture body), violating scope
--   uniqueness rules
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Expected Result: Triggers semantic error: duplicate declaration
-- Dependencies: None
-- =============================================================
entity declaration_smn_001 is
  port (
    value_in  : in  integer range 0 to 127;
    value_out : out integer range 0 to 127
  );
end entity declaration_smn_001;

architecture rtl of declaration_smn_001 is
  type t_limit is range 0 to 255;
  -- ERROR: constant name 't_limit' conflicts with existing type 't_limit'
  constant t_limit : integer := 100;
  signal s_val : integer range 0 to 127 := 0;
begin
  s_val <= value_in mod t_limit when value_in < t_limit else 0;
  value_out <= s_val;
end architecture rtl;
