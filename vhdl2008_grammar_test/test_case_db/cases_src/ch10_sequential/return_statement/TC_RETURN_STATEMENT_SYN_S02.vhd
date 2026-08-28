-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive
-- Test Focus: return without expression in procedure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ret_spc2_ent is port(r:out integer); end entity;
architecture bh of ret_spc2_ent is
  procedure p_early_exit(x:in integer; signal y:out integer) is begin
    if x<0 then y<=0; return; end if;
    y<=x;
  end;
begin process begin p_early_exit(-5,r); wait; end process; end architecture bh;
