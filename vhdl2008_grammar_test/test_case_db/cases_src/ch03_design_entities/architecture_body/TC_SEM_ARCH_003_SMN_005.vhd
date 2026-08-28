-- =============================================================
-- Case ID: TC_SEM_ARCH_003_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_ARCH_003
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Identifiers declared in architecture_declarative_part must be visible in the statement part - but an undeclared identifier triggers scope_visibility_error
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: Negative case: statement part references signal "undeclared_bus" not declared in the declarative part (no type, no subtype_indication), the name has no matching declaration in the architecture declarative_part, verifying the analyzer performs declarative-region scope resolution on names used in the statement part
-- Expected Result: Triggers semantic error: identifier not declared in architecture declarative part
-- Dependencies: None
-- =============================================================
entity sem_arch_003_bad is
  port(clk:in bit; out_val:out integer);
end entity;
architecture bh of sem_arch_003_bad is
  signal s_valid:bit:='0';
begin
  process(clk)
  begin
    if clk'event and clk='1' then
      s_valid<='1';
      out_val<=undeclared_bus;
    end if;
  end process;
end architecture bh;
