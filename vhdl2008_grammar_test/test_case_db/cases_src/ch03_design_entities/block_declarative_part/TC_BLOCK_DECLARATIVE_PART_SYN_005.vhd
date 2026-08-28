-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: block_declarative_part with two declaration items(type+constant): the block declares a custom type followed by a constant based on that type, verifying that the order dependency of two declaration items in the declarative part is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdp_two_ent is
  port(input_val : in integer; result : out integer);
end entity;
architecture bh of bdp_two_ent is
begin
  b_two : block
    type t_count is range 0 to 999;
    constant C_MAX_COUNT : t_count := 500;
    signal s_val : t_count := 0;
  begin
    s_val <= t_count(input_val) when input_val <= integer(C_MAX_COUNT) else C_MAX_COUNT;
    result <= integer(s_val);
  end block;
end architecture bh;
