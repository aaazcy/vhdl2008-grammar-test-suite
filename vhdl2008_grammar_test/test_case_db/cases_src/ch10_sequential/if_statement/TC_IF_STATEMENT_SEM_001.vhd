-- =============================================================
-- Case ID: TC_IF_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_IF_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: if_statement ::= [ if_label : ] if condition then sequence_of_statements { elsif condition then sequence_of_statements } [ else sequence_of_statements ] end if [ if_label ] ;
-- Case Type: Positive
-- Test Focus: SEM: Mutually exclusive if-elsif-else branches form exhaustive coverage over a discrete type — the condition checks an enumerated type `t_op` with exactly four values (IDLE, READ, WRITE, FLUSH); each branch maps one value with else covering any remaining; the semantic check verifies that for every possible value of `t_op` exactly one branch executes, leaving no value unhandled and no overlapping conditions; output is a 2-bit encoded result derived from the operand
-- Expected Result: Compiles and simulates successfully — all four t_op values produce distinct encode_o outputs
-- Dependencies: Simulator with full VHDL 2008 support
-- =============================================================
entity if_fullcover_ent is port(
  opcode   : in  bit_vector(1 downto 0);
  encode_o : out bit_vector(1 downto 0)
); end entity;
architecture bh of if_fullcover_ent is
  type t_op is (IDLE, READ, WRITE, FLUSH);
  signal s_op : t_op;
begin
  -- decode opcode to enum
  with opcode select
    s_op <= IDLE  when "00",
            READ  when "01",
            WRITE when "10",
            FLUSH when others;

  process(s_op) begin
    if s_op = IDLE then
      encode_o <= "00";
    elsif s_op = READ then
      encode_o <= "01";
    elsif s_op = WRITE then
      encode_o <= "10";
    else
      encode_o <= "11";
    end if;
  end process;
end architecture bh;
