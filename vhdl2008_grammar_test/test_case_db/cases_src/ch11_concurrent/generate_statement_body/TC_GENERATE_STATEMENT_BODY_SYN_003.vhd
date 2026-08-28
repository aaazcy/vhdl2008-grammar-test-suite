-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Positive
-- Test Focus: Minimal generate body with end——`end alt_a;` explicitly closes the alternative body, verifying that a generate_statement_body can carry the `end alternative_label ;` tail
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gen_body_end_ent is
  port(a, b : in bit; y : out bit);
end entity gen_body_end_ent;
architecture bh of gen_body_end_ent is
  subtype t_sel is integer range 0 to 1;
  constant sel : t_sel := 0;
begin
  gen_ex : case sel generate
    when alt_and : 0 =>
      y <= a and b;
    end alt_and;
    when alt_or : 1 =>
      y <= a or b;
    end alt_or;
  end generate gen_ex;
end architecture bh;
