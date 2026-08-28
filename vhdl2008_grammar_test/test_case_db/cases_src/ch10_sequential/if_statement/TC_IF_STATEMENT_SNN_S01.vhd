-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Test Focus: if_statement: missing "then" after condition
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity is_e is port(r:out integer); end entity;
architecture bh of is_e is
  signal s:integer:=0;
begin
  process(s) is begin
    if s=0  -- ERROR: missing "then"
      r<=1;
    end if;
  end process;
end architecture;
