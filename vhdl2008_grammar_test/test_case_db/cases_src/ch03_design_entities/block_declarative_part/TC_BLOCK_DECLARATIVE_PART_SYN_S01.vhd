-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Test Focus: Block declarative part: zero or more block_declarative_items
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_block_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_block_declarative_part_syn_s01 is
begin
  blk_bdp:block is
    type t_d is array(0 to 3) of integer; constant C_I:t_d:=(others=>0);
    signal s_d:t_d:=C_I;
    function f_sum(d:t_d) return integer is variable v:integer:=0;
    begin for i in d'range loop v:=v+d(i); end loop; return v; end function;
  begin s_d<=(0=>1,1=>2,2=>3,3=>4); r<=f_sum(s_d); end block;end architecture bh;
