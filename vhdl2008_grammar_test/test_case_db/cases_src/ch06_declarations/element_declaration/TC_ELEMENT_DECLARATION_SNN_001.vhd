-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_001
-- Rule Type: Syntax
-- BNF Production: ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::=
--   identifier_list : element_subtype_definition ;
-- Test Focus: Missing colon in element declaration — BNF
--   requires a colon between identifier_list and
--   element_subtype_definition; here the colon is omitted
--   causing a parse failure at the subtype token
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity element_declaration_snn_001 is
  port (
    data_in  : in  bit_vector(3 downto 0);
    data_out : out bit_vector(3 downto 0)
  );
end entity element_declaration_snn_001;

architecture rtl of element_declaration_snn_001 is
  -- ERROR: missing colon between identifier and subtype in record element
  type t_broken_rec is record
    field_a bit_vector(3 downto 0);
    field_b bit;
  end record;

  signal s_rec : t_broken_rec;
  signal s_out : bit_vector(3 downto 0);
begin
  s_rec.field_a <= data_in;
  s_rec.field_b <= '1';
  s_out <= s_rec.field_a;
  data_out <= s_out;
end architecture rtl;
