-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: Label mismatch between opening if_label "L_outer" and closing end if label "L_wrong" — the BNF requires that the optional end-if label match the opening if_label exactly; here `L_outer: if ... then ... end if L_wrong;` uses a different identifier at close, violating the syntactic constraint that [if_label] tokens must be identical when both are present
-- Expected Result: Triggers syntax error: if_label mismatch at end if
-- Dependencies: None
-- =============================================================
entity if_lblmism_ent is port(
  din  : in  integer range 0 to 15;
  dout : out integer range 0 to 15
); end entity;
architecture bh of if_lblmism_ent is
begin
  process(din) begin
    L_outer: if din > 7 then
      dout <= din;
    else
      dout <= 0;
    end if L_wrong;
  end process;
end architecture bh;
