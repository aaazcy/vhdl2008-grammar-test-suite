-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: the mod operator used for ring buffer index wraparound — after incrementing the counter, taking modulo of the buffer depth implements the index wrapping back to zero, verifying the use of mod in an expression to implement a hardware ring buffer pointer
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_mod_ring is
  port (
    clk      : in  bit;
    inc_i    : in  bit;
    buf_idx_o: out integer range 0 to 7
  );
end entity ent_mod_ring;

architecture rtl of ent_mod_ring is
  signal ptr : integer range 0 to 7 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if inc_i = '1' then
        ptr <= (ptr + 1) mod 8;
      end if;
    end if;
  end process;
  buf_idx_o <= ptr;
end architecture rtl;
