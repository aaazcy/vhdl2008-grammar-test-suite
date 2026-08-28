-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Negative
-- Test Focus: SNN: missing trailing semicolon - procedure p_bad(signal v:out bit) missing ; afterwards, making subprogram_declaration incomplete
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sd_nosemi_ent is port(r:out bit); end entity;
architecture bh of sd_nosemi_ent is
  -- ERROR: missing terminating ';' after subprogram_declaration
  procedure p_broken(signal v:out bit)
begin
  r<='0';
end architecture bh;
