-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: block_declarative_part with mixed declaration items(type+subtype+constant+signal+alias): verifying the syntactic legality of mixing multiple different categories of block_declarative_item in the declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdp_mixed_ent is
  port(din : in bit_vector(3 downto 0); parity : out bit);
end entity;
architecture bh of bdp_mixed_ent is
begin
  b_mixed : block
    type t_nibble is array(3 downto 0) of bit;
    subtype t_data is t_nibble;
    constant C_ZERO : t_nibble := (others => '0');
    signal s_buf : t_nibble := C_ZERO;
    alias a_msb is s_buf(3);
    signal s_xor : bit := '0';
  begin
    s_buf <= t_nibble(din);
    s_xor <= s_buf(0) xor s_buf(1) xor s_buf(2) xor s_buf(3);
    parity <= s_xor;
  end block;
end architecture bh;
