-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: sequential_statement appears in declarative_part - signal assignment appears in declaration region position where only declaration items are allowed
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sdp_bad_ent is port(r:out integer); end entity;
architecture bh of sdp_bad_ent is
  function f_broken return integer is
    variable v:integer:=0;
    v:=1; -- ERROR: statement in declarative_part before 'begin'
  begin
    return 0;
  end function;
begin
  r<=0;
end architecture bh;
