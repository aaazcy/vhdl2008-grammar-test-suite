-- =============================================================
-- Case ID: TC_RELATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: < and > operator combination: two relations joined by and, comparing the lower/upper boundaries respectively
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_lt_gt_ent is
  port(val, lo, hi : in integer; in_range : out boolean);
end entity;
architecture rtl of rel_lt_gt_ent is
begin
  in_range <= (val >= lo) and (val <= hi);
end architecture rtl;
