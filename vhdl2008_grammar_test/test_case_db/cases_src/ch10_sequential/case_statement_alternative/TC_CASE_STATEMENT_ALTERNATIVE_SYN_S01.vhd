-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Test Focus: Case statement alternative: when choices => sequence_of_statements — single case branch
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_case_statement_alternative_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_case_statement_alternative_syn_s01 is
  signal s_sel:integer range 0 to 2:=0;
begin
  process(s_sel) is
  begin
    case s_sel is
      when 0 => r<=1;
      when 1 => r<=2;
      when others => r<=0;
    end case;
  end process;
end architecture bh;
