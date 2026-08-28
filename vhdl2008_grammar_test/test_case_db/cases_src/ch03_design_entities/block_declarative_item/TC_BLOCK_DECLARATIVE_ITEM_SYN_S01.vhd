-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Test Focus: Block declarative items: subprogram, type, subtype, constant, signal, file, alias, attribute, component, use clause, group
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_block_declarative_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_block_declarative_item_syn_s01 is
begin
  blk_bdi:block is
    type t_l is range 0 to 63; subtype t_ls is t_l range 0 to 31;
    constant C_L:t_l:=0; signal s_l:t_l:=C_L; alias a_l is s_l;
    attribute la:string; attribute la of s_l:signal is "block_local";
  begin s_l<=1; r<=integer(s_l); end block;end architecture bh;
