-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: all valid declarative item
--   variants together — subprogram_declaration (procedure +
--   impure function), attribute_specification on both, and
--   a use_clause. Exercises the full alternation grammar.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_di_syn_s01 is
  port (
    trig   : in  bit;
    status : out bit
  );
end entity pt_decl_di_syn_s01;

architecture rtl of pt_decl_di_syn_s01 is
  attribute fsm_state : string;
  type t_controller is protected
    procedure arm;
    procedure disarm;
    impure function triggered return bit;
    attribute fsm_state of triggered : function is "checking";
    attribute fsm_state of arm : procedure is "arming";
  end protected;
  type t_controller is protected body
    variable v_trig : bit := '0';
    variable v_armed : bit := '0';
    procedure arm is begin v_armed := '1'; end procedure;
    procedure disarm is begin v_armed := '0'; end procedure;
    impure function triggered return bit is
    begin
      if v_armed = '1' then return '1'; else return '0'; end if;
    end function;
  end protected body;
  shared variable sv : t_controller;
begin
  process(trig)
  begin
    if trig'event and trig = '1' then
      sv.arm;
      status <= sv.triggered;
    end if;
  end process;
end architecture rtl;
