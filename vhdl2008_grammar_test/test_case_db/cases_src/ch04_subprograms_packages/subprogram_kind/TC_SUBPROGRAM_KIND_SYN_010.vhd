-- =============================================================
-- Case ID: TC_SUBPROGRAM_KIND_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_KIND
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_kind ::= procedure | function
-- Case Type: Positive
-- Test Focus: subprogram_kind in the end clause with both kind and designator omitted and empty: end; completely omits the optional tokens, verifies the epsilon behavior of the BNF when subprogram_kind can be fully omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sk_empty_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sk_empty_ent is
  procedure p_set(signal v:out integer) is
  begin v<=a; end;
begin
  p_set(y);
end architecture bh;
