-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: Multiple elsif branches where the second elsif is missing the "then" keyword — `elsif val > 60` is directly followed by assignment without `then`; the BNF production requires `elsif condition then`, making `then` a mandatory separator between each elsif condition and its sequence_of_statements; the first elsif is correctly formed to ensure parsing reaches the error point
-- Expected Result: Triggers syntax error: missing "then" after elsif condition
-- Dependencies: None
-- =============================================================
entity if_elsifnoth_ent is port(
  val   : in  integer range 0 to 100;
  grade : out integer range 0 to 4
); end entity;
architecture bh of if_elsifnoth_ent is
begin
  process(val) begin
    if val >= 90 then
      grade <= 4;
    elsif val >= 75 then
      grade <= 3;
    elsif val > 60
      grade <= 2;
    else
      grade <= 1;
    end if;
  end process;
end architecture bh;
