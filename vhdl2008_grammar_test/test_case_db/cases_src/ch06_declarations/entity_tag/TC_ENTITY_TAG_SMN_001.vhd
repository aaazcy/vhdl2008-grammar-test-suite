-- =============================================================
-- Case ID: TC_ENTITY_TAG_SMN_001
-- Related Rule ID: SMN_ENTITY_T_001
-- Rule Type: Semantic
-- BNF Production: ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8, Section 12.3
-- Production: entity_tag ::=
--   simple_name | character_literal | operator_symbol
-- Test Focus: Attribute specification referencing a
--   non-existent entity_tag — the entity_designator in
--   an attribute_specification must name a declared entity
--   visible in the current scope; here 's_missing' is used
--   but has never been declared
-- Case Type: Negative
-- Error Category: elaboration_error
-- Expected Result: Triggers semantic error: undeclared entity
-- Dependencies: None
-- =============================================================
entity entity_tag_smn_001 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity entity_tag_smn_001;

architecture rtl of entity_tag_smn_001 is
  attribute keep_signal : string;
  signal s_data : bit_vector(7 downto 0) := (others => '0');

  -- ERROR: 's_missing' is not declared — entity_tag references
  -- a non-existent signal name
  attribute keep_signal of s_missing : signal is "TRUE";

begin
  s_data <= data_in;
  data_out <= s_data;
end architecture rtl;
