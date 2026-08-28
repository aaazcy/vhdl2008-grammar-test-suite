-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: Missing the "<>" box symbol in index_subtype_definition.
--            The index_subtype_definition requires the range box "<>"
--            to indicate an unconstrained index. Without it, the
--            definition is malformed.
-- Expected Result: Triggers syntax error (missing "<>")
-- Dependencies: None
-- =============================================================
entity bad_index_no_box is
  port (
    q : out bit
  );
end entity bad_index_no_box;

architecture rtl of bad_index_no_box is
  -- ERROR: "range" without "<>" is incomplete
  type bad_arr is array (integer range) of bit;
  signal s : bad_arr;
begin
  q <= '0';
end architecture rtl;
