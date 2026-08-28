-- =============================================================
-- Case ID: TC_DECLARATION_SNN_001
-- Rule Type: Syntax
-- BNF Production: DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration
--   | object_declaration | interface_declaration
--   | alias_declaration | attribute_declaration
--   | component_declaration | group_template_declaration
--   | group_declaration | entity_declaration
--   | configuration_declaration | subprogram_declaration
--   | package_declaration
-- Test Focus: Missing 'is' keyword in type_declaration — BNF requires
--   type_declaration ::= full_type_declaration | incomplete_type_declaration
--   and full_type_declaration requires 'is' after identifier
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity declaration_snn_001 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity declaration_snn_001;

architecture rtl of declaration_snn_001 is
  -- ERROR: type_declaration missing 'is' keyword
  type t_byte range 0 to 255;
  signal s_buf : integer := 0;
begin
  s_buf <= to_integer(unsigned(data_in));
  data_out <= bit_vector(to_unsigned(s_buf, 8));
end architecture rtl;
