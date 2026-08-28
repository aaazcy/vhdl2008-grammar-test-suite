-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Positive
-- Test Focus: wait on + timeout_clause coexisting — `wait on req for 100 ns` — sensitivity_clause + timeout_clause, either the request signal or a timeout wakes the process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sc_syn5_ent is port(req,ack:in bit; y:out integer); end entity;
architecture bh of sc_syn5_ent is
  signal s_timeout : integer := 0;
begin
  process is
  begin
    wait on req for 100 ns;
    if req = '1' then
      s_timeout <= 0;
    else
      s_timeout <= 1;
    end if;
    wait on ack for 50 ns;
    y <= s_timeout;
  end process;
end architecture bh;
