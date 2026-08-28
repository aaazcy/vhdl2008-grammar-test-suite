-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Missing the "of" keyword between the index definitions
--            and the element_subtype_indication. The BNF requires
--            "of" as a literal separator.
-- Expected Result: Triggers syntax error (missing "of")
-- Dependencies: None
-- =============================================================
entity bad_unbounded_no_of is
  port (
    x : out bit
  );
end entity bad_unbounded_no_of;

architecture rtl of bad_unbounded_no_of is
  -- ERROR: missing "of" keyword
  type bad_arr is array (integer range <>) bit;
  signal s : bad_arr;
begin
  x <= '0';
end architecture rtl;
