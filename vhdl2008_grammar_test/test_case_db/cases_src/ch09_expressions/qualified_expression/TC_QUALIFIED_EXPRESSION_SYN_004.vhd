-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: record type aggregate qualification: t_point'(x=>1, y=>2) adds a type qualification to a record type aggregate, verifying the qualified expression of a user-defined type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_rec is
  port (
    px, py : out integer
  );
end entity ent_qe_rec;

architecture rec_qual of ent_qe_rec is
  type t_point is record
    x, y : integer;
  end record;
  signal s_pt : t_point;
begin
  s_pt <= t_point'(x => 10, y => 20);
  px <= s_pt.x;
  py <= s_pt.y;
end architecture rec_qual;
