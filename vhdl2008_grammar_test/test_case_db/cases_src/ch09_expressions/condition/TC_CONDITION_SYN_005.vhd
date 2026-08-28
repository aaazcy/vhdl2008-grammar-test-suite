-- =============================================================
-- Case ID: TC_CONDITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: VHDL 2008 ?? condition operator: the if ?? s form implicitly converts bit_vector to boolean, verifying the application of the ?? operator in a condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_dq is
  port (
    s     : in  bit;
    flag  : out boolean
  );
end entity ent_cond_dq;

architecture cond_op of ent_cond_dq is
begin
  process(s)
  begin
    if ?? s then
      flag <= true;
    else
      flag <= false;
    end if;
  end process;
end architecture cond_op;
