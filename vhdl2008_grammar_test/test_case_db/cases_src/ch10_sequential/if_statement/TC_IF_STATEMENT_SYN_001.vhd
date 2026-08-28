-- =============================================================
-- Case ID: TC_IF_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: minimal if-then: no label, single condition (bit comparison s_en='1'), then body with single assignment, no elsif/else, end if without label, verifies the minimal form of if_statement — all optional clauses omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity if_min_ent is port(en:in bit; a:in integer; y:out integer); end entity;
architecture bh of if_min_ent is
begin
  process(en,a) begin
    if en='1' then y<=a; end if;
  end process;
end architecture bh;
