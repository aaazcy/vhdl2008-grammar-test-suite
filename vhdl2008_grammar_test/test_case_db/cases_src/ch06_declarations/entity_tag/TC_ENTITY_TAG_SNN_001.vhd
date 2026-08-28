-- =============================================================
-- Case ID: TC_ENTITY_TAG_SNN_001
-- Rule Type: Syntax
-- BNF Production: ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::=
--   simple_name | character_literal | operator_symbol
-- Test Focus: Invalid entity_tag in attribute specification —
--   the entity_name_list in an attribute_specification must
--   contain valid entity_designator(s); here a numeric literal
--   is used where an entity_tag (identifier) is required,
--   violating the entity_designator grammar
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity entity_tag_snn_001 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity entity_tag_snn_001;

architecture rtl of entity_tag_snn_001 is
  attribute fanout_limit : integer;
  signal s_buf : bit_vector(7 downto 0);

  -- ERROR: '42' is not a valid entity_tag (not simple_name,
  -- character_literal, or operator_symbol)
  attribute fanout_limit of 42 : signal is 8;

begin
  s_buf <= data_in;
  data_out <= s_buf;
end architecture rtl;
