-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: nested blocks: the block_statement_part of an outer block contains an inner block statement — verifying that the {concurrent_statement} of block_statement_part may contain a block_statement for hierarchical nesting
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_part_nested_ent is
  port(clk : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity blk_part_nested_ent;
architecture bh of blk_part_nested_ent is
begin
  blk_outer : block is
    signal s_pipe1, s_pipe2 : bit_vector(3 downto 0);
  begin
    -- inner block as a concurrent statement within outer block_statement_part
    blk_inner : block is
    begin
      s_pipe1 <= din;
    end block blk_inner;
    proc_pipe : process(clk) is
    begin
      if clk'event and clk = '1' then
        s_pipe2 <= s_pipe1;
        dout    <= s_pipe2;
      end if;
    end process proc_pipe;
  end block blk_outer;
end architecture bh;
