-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: assertion_statement ::= [ label : ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: Assert with all clauses: includes label "a_check" + assert condition (relational s_val>=0) + report (string expression with integer'image) + severity(error), verifying all optional clauses label/report/severity of assertion are usable and report and severity can contain complex expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity assert_ent is port(val:in integer; ok:out boolean); end entity;
architecture bh of assert_ent is
  signal s_val:integer:=0;
begin
  process(val) begin
    s_val<=val;
    a_check:assert s_val>=0
      report "Negative value: " & integer'image(s_val)
      severity error;
    ok<=(s_val>=0);
  end process;
end architecture bh;
