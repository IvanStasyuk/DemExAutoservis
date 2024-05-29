using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DemExAutoservis.Pages
{
    /// <summary>
    /// Логика взаимодействия для Autorisation.xaml
    /// </summary>
    public partial class Autorisation : Page
    {
        public Autorisation()
        {
            InitializeComponent();
            Loaded += Captcha_Loaded;
        }

        private void BtnVhod_Click(object sender, RoutedEventArgs e)
        {
            var varLogin = name_databaseEntities.GetContext().user.FirstOrDefault(x => x.Login == TBLogin.Text);
            var varPassword = name_databaseEntities.GetContext().user.FirstOrDefault(x => x.password == TBPassword.Text);
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(TBLogin.Text))
                    errors.AppendLine("Укажите логин");
                if (string.IsNullOrEmpty(TBPassword.Text))
                    errors.AppendLine("Укажите пароль");
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString());
                    return;
                }
                var UserVhod = name_databaseEntities.GetContext().user.FirstOrDefault(x => x.Login == TBLogin.Text && x.password == TBPassword.Text);
                if (varLogin == null)
                {
                    MessageBox.Show("Логин введен с ошибками", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else if (varPassword == null)
                {
                    MessageBox.Show("Пароль введен с ошибками", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (TBInputCaptcha.Text == null)
                {
                    MessageBox.Show("Введите капчу", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (TBInputCaptcha.Text != CaptchaView.Text)
                {
                    MessageBox.Show("Капча введена неверно", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                else if (TBInputCaptcha.Text == CaptchaView.Text)
                {
                    MessageBox.Show("Капча верна", "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
                    switch (UserVhod.userroleid)
                    {
                        case 1:
                            MessageBox.Show("Добро пожаловать, Мастер приёмщик " + UserVhod.firstname + "!", "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.myFrame.Navigate(new Pages.PlaceMasterEnter());
                            break;
                        case 2:
                            MessageBox.Show("Добро пожаловать, Автомеханик " + UserVhod.firstname + "!", "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.myFrame.Navigate(new Pages.PlaceAutoMechanic());
                            break;
                        case 3:
                            MessageBox.Show("Добро пожаловать, Автодиагност " + UserVhod.firstname + "!", "Авторизация", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.myFrame.Navigate(new Pages.PlaceAutoDiagnost());
                            break;
                        default:
                            MessageBox.Show("В системе нет таких должностей", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Error);
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void Captcha_Loaded(object sender, RoutedEventArgs e)
        {
            Random captcha = new Random();
            CaptchaView.Text = "";
            int TypeChar = captcha.Next(0, 2);
            char CharRandom;
            for (int i = 0; i < 5; i++)
            { 
            if (TypeChar == 0)
            {
                CharRandom = (char)captcha.Next(68, 91);
            }
            else
            {
                CharRandom = (char)captcha.Next(48, 58);
            }
            CaptchaView.Text += CharRandom;
            }
        }

        private void WindowMasterEnter_Click(object sender, RoutedEventArgs e)
        {
            Manager.myFrame.Navigate(new Pages.PlaceMasterEnter());
        }

        private void WindowAutoMechanic_Click(object sender, RoutedEventArgs e)
        {
            Manager.myFrame.Navigate(new Pages.PlaceAutoMechanic());
        }

        private void WindowAutoDiagnost_Click(object sender, RoutedEventArgs e)
        {
            Manager.myFrame.Navigate(new Pages.PlaceAutoDiagnost());
        }
    }
}
