-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDP_001
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: all declaration items defined in entity_declarative_part are legally visible and usable in the corresponding architecture body
-- Case Type: Positive
-- Error Category: scope_visibility
-- Test Focus: Positive example: the entity declarative part defines type t_data(0 to 255), constant C_SCALE=10, signal s_mid, function f_scale, all referenced in the architecture via signal declaration(using t_data), constant expression(using C_SCALE), signal assignment(using s_mid) and function call(using f_scale), verifying the visibility of the entity declarative part propagates to the architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edp_sem_ent is
  port(clk:in bit; raw_val:in integer; scaled_val:out integer);
  type t_data is range 0 to 255;
  constant C_SCALE:integer:=10;
  signal s_mid:t_data:=0;
  function f_scale(x:t_data) return t_data is
  begin return x*t_data(C_SCALE); end function f_scale;
end entity edp_sem_ent;
architecture bh of edp_sem_ent is
begin
  process(clk) begin
    if clk'event and clk='1' then
      s_mid<=f_scale(t_data(raw_val mod 25));
    end if;
  end process;
  scaled_val<=integer(s_mid);
end architecture bh;
