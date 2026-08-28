-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Negative
-- Test Focus: SNN: spelling error — `null` misspelled as `nul`, verifying that the null keyword must be fully spelled
-- Expected Result: Triggers syntax error: unknown identifier 'nul'
-- Dependencies: None
-- =============================================================
entity null_bad_kw_ent is
  port (en : in bit; done : out bit);
end entity null_bad_kw_ent;

architecture err of null_bad_kw_ent is
begin
  process(en) is
  begin
    if en = '1' then
      nul;  -- ERROR: 'nul' is not 'null' keyword
    end if;
    done <= en;
  end process;
end architecture err;
