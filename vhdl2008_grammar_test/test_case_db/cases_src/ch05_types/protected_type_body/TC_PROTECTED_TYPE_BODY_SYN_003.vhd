-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: Protected body with the optional trailing
--   protected_type_simple_name. Tests that the name after
--   'end protected body' matches the type name.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_named is
  port (
    strobe : in  bit;
    result : out bit
  );
end entity pt_body_named;

architecture rtl of pt_body_named is
  type t_flag_flip is protected
    procedure toggle;
    impure function state return bit;
  end protected;
  type t_flag_flip is protected body
    variable v_flag : bit := '0';
    procedure toggle is
    begin
      v_flag := not v_flag;
    end procedure;
    impure function state return bit is
    begin
      return v_flag;
    end function;
  end protected body t_flag_flip;
  shared variable sv_flag : t_flag_flip;
begin
  process(strobe)
  begin
    if strobe'event and strobe = '1' then
      sv_flag.toggle;
      result <= sv_flag.state;
    end if;
  end process;
end architecture rtl;
