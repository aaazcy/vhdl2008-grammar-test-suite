-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Positive
-- Test Focus: Minimal form: only `null;` keyword + semicolon, no label — verifying the minimal syntactic form of a null statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity null_minimal_ent is
  port (trigger : in bit; ready : out bit);
end entity null_minimal_ent;

architecture rtl of null_minimal_ent is
begin
  process(trigger) is
  begin
    if trigger = '1' then
      null;
    end if;
    ready <= trigger;
  end process;
end architecture rtl;
