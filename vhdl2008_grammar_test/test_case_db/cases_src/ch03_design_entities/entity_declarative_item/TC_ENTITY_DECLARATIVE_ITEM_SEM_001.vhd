-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDI_001
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: identifiers declared in entity_declarative_item are visible in its architecture and can be legally used
-- Case Type: Positive
-- Error Category: scope_visibility
-- Test Focus: Positive example: type(t_param_range 0 to 127), subtype(t_nibble range 0 to 15), constant(C_SHIFT=4), function(f_twice) defined in the entity declarative part are all legally used in the architecture via process signal assignment and function calls, verifying declaration items of the entity declarative part are fully visible to the architecture body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_sem_ent is
  port(clk:in bit; din:in integer; dout:out integer);
  type t_param is range 0 to 127;
  subtype t_nibble is t_param range 0 to 15;
  constant C_SHIFT:t_param:=4;
  function f_twice(x:t_param) return t_param is
  begin return x*2; end function f_twice;
end entity edi_sem_ent;
architecture bh of edi_sem_ent is
  signal s_reg:t_param:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then
      s_reg<=f_twice(t_param(din mod 64));
    end if;
  end process;
  dout<=integer(s_reg)+integer(C_SHIFT);
end architecture bh;
