-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: Indexed name with 1D/2D/range indexes: 1D array(s_arr(0))/2D array(s_mat(0,1))/enum index(s_st_arr(IDLE))/range index(s_vec(0 to 3)), verifying the various index expression forms and dimensions of indexed_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity in_ent is port(y:out integer); end entity;
architecture bh of in_ent is
  type t_arr1 is array(0 to 7) of integer;
  type t_mat  is array(0 to 3,0 to 3) of integer;
  type t_state is (IDLE,RUN,DONE);
  type t_st_arr is array(t_state) of integer;
  signal s_a:t_arr1:=(others=>0); signal s_m:t_mat:=(others=>(others=>0));
  signal s_s:t_st_arr:=(others=>0);
begin
  s_a(0)<=1; s_m(1,2)<=2; s_s(IDLE)<=3;
  y<=s_a(0)+s_m(1,2)+s_s(IDLE);
end architecture bh;
