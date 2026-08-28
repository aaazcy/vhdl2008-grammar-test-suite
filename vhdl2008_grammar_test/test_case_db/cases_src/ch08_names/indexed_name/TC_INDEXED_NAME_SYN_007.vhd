-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: indexed_name used as an assignment target (left-hand side) — s_fifo(wr_ptr) <= data_in uses an indexed_name as the target of a signal assignment, verifying that indexed_name is not only readable (right side) but also writable (left-side target)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity idx_name_lhs_write is
  port(wr_ptr : in natural range 0 to 15;
       data_in : in bit_vector(7 downto 0);
       rd_ptr : in natural range 0 to 15;
       data_out : out bit_vector(7 downto 0));
end entity;

architecture vhdl2008 of idx_name_lhs_write is
  type t_fifo_mem is array(0 to 15) of bit_vector(7 downto 0);
  signal s_fifo : t_fifo_mem := (others => (others => '0'));
begin
  process(wr_ptr, data_in, rd_ptr)
  begin
    s_fifo(wr_ptr) <= data_in;
    data_out <= s_fifo(rd_ptr);
  end process;
end architecture vhdl2008;
