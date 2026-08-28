-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: Condition is an integer signal used directly without a relational operator — `if s_val then` where s_val is of type integer, not boolean; the BNF production requires `condition` which must evaluate to type boolean; an integer is not a boolean expression and violates the type requirement for the if keyword's condition operand
-- Expected Result: Triggers type error: condition must be boolean expression, found integer
-- Dependencies: None
-- =============================================================
entity if_nonbool_ent is port(
  s_val : in  integer range 0 to 7;
  flag  : out bit
); end entity;
architecture bh of if_nonbool_ent is
begin
  process(s_val) begin
    if s_val then
      flag <= '1';
    else
      flag <= '0';
    end if;
  end process;
end architecture bh;
