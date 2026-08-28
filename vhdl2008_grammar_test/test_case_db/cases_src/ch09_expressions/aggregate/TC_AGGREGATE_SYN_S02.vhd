-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Multi-index named array aggregate: 0=>1, 1｜2｜3=>5, 4 to 7=>10, others=>0 — four different choices forms (single index, pipe, range, others) combined in the same aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity agg_named_index is
  port (
    sum : out integer
  );
end entity agg_named_index;

architecture multi_choice of agg_named_index is
  type t_arr is array(0 to 15) of integer;
  signal s : t_arr;
begin
  s <= (0=>1, 1|2|3=>5, 4 to 7=>10, others=>0);
  sum <= s(0) + s(3) + s(5);
end architecture multi_choice;
