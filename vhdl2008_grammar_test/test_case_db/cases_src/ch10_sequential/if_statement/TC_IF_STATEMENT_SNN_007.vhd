-- =============================================================
-- Case ID: TC_IF_STATEMENT_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: Inner nested if-statement missing its closing `end if` — the outer if-then-else contains an inner if-then-else that is never terminated; after the inner else branch's assignment, the outer elsif immediately follows, leaving the inner if_statement unclosed; the BNF requires each if_statement in a nesting to have its own `end if` terminating keyword
-- Expected Result: Triggers syntax error: missing end if for inner if_statement
-- Dependencies: None
-- =============================================================
entity if_missend_ent is port(
  sel_a, sel_b : in  bit;
  val_in       : in  integer range 0 to 255;
  val_out      : out integer range 0 to 255
); end entity;
architecture bh of if_missend_ent is
begin
  process(sel_a, sel_b, val_in) begin
    if sel_a = '1' then
      if sel_b = '1' then
        val_out <= val_in / 2;
      else
        val_out <= val_in;
    elsif sel_a = '0' then
      val_out <= 0;
    else
      val_out <= val_in;
    end if;
  end process;
end architecture bh;
