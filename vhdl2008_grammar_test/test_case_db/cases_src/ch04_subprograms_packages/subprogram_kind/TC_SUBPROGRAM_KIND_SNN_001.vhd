-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Negative
-- Test Focus: SNN: subprogram_kind in the end clause mismatches the body type — a function body ends with end procedure, the kind token contradicts the actual body type
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sk_mismatch_ent is port(r:out integer); end entity;
architecture bh of sk_mismatch_ent is
  -- ERROR: function body ended with 'end procedure' — subprogram_kind mismatch
  function f_broken return integer is
  begin return 0;
  end procedure;
begin
  r<=0;
end architecture bh;
