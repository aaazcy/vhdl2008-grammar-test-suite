-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: block_header with three generics + partial generic_map: the generic clause defines 3 generics (integer+time+boolean) and generic_map maps only 2 of them (the rest use default values), verifying the syntactic legality of partial mapping
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bhdr_partial_ent is
  port(clk : in bit; toggle : out bit);
end entity;
architecture bh of bhdr_partial_ent is
  signal s_int : bit := '0';
begin
  b_partial : block
    generic(G_DIV : integer := 2; G_DLY : time := 1 ns; G_INV : boolean := false);
    generic map(G_DIV => 4, G_DLY => 2 ns);
    signal s_cnt : integer := 0;
  begin
    process(clk)
    begin
      if clk'event and clk = '1' then
        if s_cnt >= G_DIV - 1 then
          s_cnt <= 0;
          s_int <= not s_int;
        else
          s_cnt <= s_cnt + 1;
        end if;
      end if;
    end process;
    toggle <= not s_int when G_INV else s_int;
  end block;
end architecture bh;
