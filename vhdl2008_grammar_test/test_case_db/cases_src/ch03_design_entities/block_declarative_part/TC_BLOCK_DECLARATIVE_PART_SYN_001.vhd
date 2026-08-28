-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Block declarative part with multiple declaration types: the block declarative part contains type/subtype/constant/signal/function(with variables+return)/alias, verifying that the various categories of block_declarative_item are legal within block scope and that the statement part can reference these declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdp_ent is port(a,b:in integer; result:out integer); end entity;
architecture bh of bdp_ent is
begin
  b_calc:block
    type t_val is range -1000 to 1000;
    subtype t_pos is t_val range 0 to 1000;
    constant C_OFFSET:t_val:=10;
    signal s_sum:t_val:=0;
    function f_clamp(x:t_val) return t_val is
    begin if x>1000 then return 1000; elsif x<-1000 then return -1000; else return x; end if; end function;
    alias a_sum is s_sum;
  begin
    s_sum<=f_clamp(t_val(a+b)+C_OFFSET);
    result<=integer(a_sum);
  end block;
end architecture bh;
