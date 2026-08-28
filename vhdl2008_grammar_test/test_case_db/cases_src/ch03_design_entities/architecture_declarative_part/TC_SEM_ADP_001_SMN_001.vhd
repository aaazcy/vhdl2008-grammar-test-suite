-- =============================================================
-- Case ID: TC_SEM_ADP_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ADP_001
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Identifiers declared in the architecture declarative part are visible in the statement part - but referencing a name in the statement part that is not declared in the declarative part triggers scope_visibility_error
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: Negative case: a process in the statement part references undeclared_signal, the name has no declaration in the architecture declarative part, verifying the analyzer performs declarative-region scope resolution on names used in the statement part and rejects the undeclared reference
-- Expected Result: Triggers semantic error: identifier not declared in architecture declarative part
-- Dependencies: None
-- =============================================================
entity adp_smn_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of adp_smn_ent is
  signal s_ok:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then s_ok<=undeclared_signal; end if;
  end process;
  y<=s_ok;
end architecture bh;
