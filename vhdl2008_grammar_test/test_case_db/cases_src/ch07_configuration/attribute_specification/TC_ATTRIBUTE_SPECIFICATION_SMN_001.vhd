-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Negative (Semantic)
-- Test Focus: Expression type mismatch — attribute was declared as integer but the expression provided is a string literal; the type of the expression must match the declared type of the attribute_designator
-- Expected Result: Triggers semantic error (type mismatch)
-- Dependencies: None
-- =============================================================
entity as_smn1_ent is port(r:out integer); end entity;
architecture bh of as_smn1_ent is
  attribute width : integer;
  -- ERROR: string expression given for integer attribute
  attribute width of bh : architecture is "thirty_two";
  signal s:integer:=0;
begin s<=1; r<=s; end architecture bh;
