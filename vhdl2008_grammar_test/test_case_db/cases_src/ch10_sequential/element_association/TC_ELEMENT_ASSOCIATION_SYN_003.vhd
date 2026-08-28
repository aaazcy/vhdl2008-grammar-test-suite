-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: element_association: named association with record aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity elem_assoc_syn3_ent is port(y:out integer); end entity;
architecture bh of elem_assoc_syn3_ent is
  type t_rec is record
    a:integer; b:bit; c:integer;
  end record;
  signal s_rec:t_rec:=(a=>5, b=>'1', c=>10);
begin
  y<=s_rec.a+s_rec.c;
end architecture bh;
